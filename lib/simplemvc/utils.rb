class String
  def to_snake_case
    self.gsub("::", "/").
      gsub(/([A-Z]+[a-z]+)([A-Z][a-z]+)([A-Z][a-z]+)/, '\1_\2_\3'). # FOoBarBar => foo_bar_bar
      gsub(/([A-Z]+[a-z]+)([A-Z][a-z]+)/, '\1_\2'). # FOOBar => foo_bar
      gsub(/([a-z\d])(A-Z)/, '\1_\2').  # FO86OBar => fo86_o_bar
      tr("-","_").
      downcase
  end

  def to_camel_case
    return self if self !~ /_/ && self =~ /[A-Z]+.*/
    split('_').map { |str| str.capitalize }.join #foo_bar => FooBar
  end
end
