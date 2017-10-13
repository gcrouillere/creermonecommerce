class CeramiquesController < ApplicationController
  skip_before_action :authenticate_user!, only: [:index, :show]

  def index
    Ceramique.all.where(user: current_user).first.present? ? @ceramiques = Ceramique.all.where(user: current_user) : @ceramiques = User.where(admin: true).first.ceramiques
    clean_orders
    uniq_categories
    if params[:all].present?
      @ceramiques
    else
      filter_by_category if params[:categories].present?
      filter_by_price if params[:prix_max].present?
    end
    @model_string = model_print
  end

  def show
    clean_orders
    @ceramique = Ceramique.find(params[:id])
    @model_string = model_print
  end

  private

  def clean_orders
    Order.all.each do |order|
      if (Time.now - order.created_at)/60/60 > ENV['BASKETDURATION'].to_f && order.state == "pending" && order.lesson.blank?
        order.basketlines.each do |basketline|
          ceramique = basketline.ceramique
          ceramique.update(stock: ceramique.stock + basketline.quantity)
          basketline.destroy
        end
        order.destroy
        session[:order] = nil
      end
    end
  end

  def uniq_categories
    @categories = @ceramiques.map do |ceramique|
      ceramique.category.name
    end
    @categories = @categories.uniq.sort
  end

  def filter_by_category
    @ceramiques = []
    params[:categories].each do |categorie|
      @ceramiques << Ceramique.all.where(category_id: Category.find_by(name: categorie).id)
    end
    @ceramiques = @ceramiques.flatten(2)
  end

  def filter_by_price
    @ceramiques = @ceramiques.select {|ceramique| ceramique.price_cents <= params[:prix_max].to_i * 100 }
  end

end

