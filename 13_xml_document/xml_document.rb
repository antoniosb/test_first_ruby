# This class build XML tagged document from blocks
class XmlDocument
  def initialize(idents = false)
    @idents = idents
  end

  def method_missing(m, *args, &_block)
    if block_given?
      tabs = build_tabulation
      %(<#{m}>#{"\n" + tabs if @idents}#{yield}#{tabs.slice(0..-3) if @idents}</#{m}>#{"\n" if @idents})
    elsif args.empty?
      "<#{m}/>"
    else
      %(<#{m} #{args[0].keys.first}='#{args[0].values.first}'/>#{"\n" if @idents})
    end
  end

  private

  def build_tabulation
    tabs ||= ''
    @level ||= 0
    @level += 1
    @level.times do
      tabs << '  '
    end
    tabs
  end
end
