module MetaTagsHelper
  def meta_title
    content_for?(:title_tag) ? content_for(:title_tag) : "Créez une boutique en ligne avec notre solution e-commerce, simple d'utilisation pour vous et vos clients."
  end

  def meta_product_name
    content_for?(:meta_product_name) ? content_for(:meta_product_name) : "Creermonecommerce.fr une application intuitive de boutique en ligne"
  end

  def meta_description
    description = "Vendez vos produits en ligne ! Site de e-commerce configurable. Créez votre compte et visualisez votre futur site de vente en ligne."
    content_for?(:description) ? content_for(:description) : description
  end

  def meta_image
    meta_image = (content_for?(:meta_image) ? content_for(:meta_image).strip : image_path(ENV['HOMEPIC']))
    # little twist to make it work equally with an asset or a url
    meta_image.starts_with?("http") ? meta_image : image_url(meta_image)
  end
end

