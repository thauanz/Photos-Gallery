module ApplicationHelper

  def error_messages_for(resource)
    #render "admin/shared/error_messages", :resource => resource
    if resource.errors.any?
      resource.errors.full_messages.collect do |msg|
        content_tag(:div, msg, :id => :error)
      end.join.html_safe
    end
  end

  def flash_messages
    flash.collect do |key, msg|
      content_tag(:span, msg, :id => key, :class => "flash_message")
    end.join.html_safe
  end

  def title(text)
    content_for(:title) { text.html_safe }
  end

  def link_image(picture)
    link_to(image_tag(picture.image_url(:small)), admin_gallery_picture_path(picture.gallery_id, picture), id: "picture_#{picture.id}")
  end

  def main_title
    "Photos Gallery"
  end

  def main_menu
    html = ""
    Gallery.all do |gallery|
      html << "<div id='gallery'><h3>"
      html << link_to(gallery.name, gallery_path(gallery), remote: true)
      html << "</h3></div>"
    end
    html.html_safe
  end
end

