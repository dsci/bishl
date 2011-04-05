require "bishl"

# for rails:

unless defined?(ApplicationHelper).nil?
  ApplicationHelper.class_eval do
    include Bishl::HTMLHelper
  end
end
