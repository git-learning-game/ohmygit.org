include Nanoc::Helpers::Rendering
include Nanoc::Helpers::ChildParent

def tabs
    [
        @items["/index.*"],
        @items["/press/index.*"],
        @items["/videos/index.*"],
    ]
end

def things
    blk = -> { newest_first(@items.find_all("/**/*").select{|i| i[:published]}) }
    if @items.frozen?
        @things ||= blk.call
    else
        blk.call
    end
end

def link_to item, text=nil
    text = item[:title] if text.nil?
    "<a href=\"#{link_for(item)}\">#{text}</a>"
end

def calculate_tags
    @items.select{|i| i[:tags]}.map{|i| i[:tags]}.flatten.uniq.sort
end

def tags
    calculate_tags
end

def link_for item
    if item[:url]
        item[:url]
    else
        item.path
    end
end

def tags_for item, link=true
    item[:tags].map do |tag|
        if link
            "<a href=\"/##{tag}\">#{tag}</a>"
        else
            tag
        end
    end.join(", ")
end

def lang_for item
    if item[:tags] and item[:tags].include? "german"
        "de"
    else
        "en"
    end
end

def title_for item
    if item.path == "/"
        "Oh My Git!"
    else
        item[:title] + " - Oh My Git!"
    end
end

def abstract_for item
    "An open source game about learning Git"
end

def thumbnail_for item
    "/assets/images/cover.png"
end

def with_tag tag
    things.select do |item|
        item[:tags] and item[:tags].include? tag
    end
end

def domain
    "https://ohmygit.org/"
end

def box(items)
    ret = "<div class=\"boxes\">"
    items.each do |item|
        ret << render("/box.*", {:item => item})
    end
    ret << "</div>"
    ret
end

def newest_first(items)
    items.select{|i| i[:updated] || i[:published] }.sort_by{|i| i[:updated] || i[:published]}.reverse
end
