require "bishl"

# for rails:

unless defined?(ApplicationHelper).nil?
  ApplicationHelper.class_eval do
    ActionView::Base.send :include, BISHL::HTMLHelper
  end
end
