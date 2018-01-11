a = [{
  "root": [
    {"admin": [
      ["file1", "file2"]
    ]},
    {"users": [
      {"posts": [
        ["post1", "post2"]
      ]},
      ["file1", "file2"]
    ]},
    ["Gemfile"]
  ]
}]

def render_dir(dir, dir_level = 0)
  dir.each do |subdir|
    case subdir.class.to_s
    when "Hash"
      subdir.each do |k, v|
        if dir_level == 0
          puts "#{k}/"
        elsif dir_level == 1
          puts "|" + "  " * (dir_level - 1) + "--" + k.to_s + "/"
        else
          puts "|" + "  " * (dir_level - 1) + "|--" + k.to_s + "/"
        end
        render_dir(v, dir_level + 1)
      end
    when "Array"
      subdir.each do |file|
        if dir_level == 0
          puts "|" + file
        elsif dir_level == 1
          puts "|" + "  " * (dir_level - 1) + "--" + file
        else
          puts "|" + "  " * (dir_level - 1) + "|--" + file
        end
      end
    end
  end
end


render_dir(a)