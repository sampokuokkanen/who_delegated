# frozen_string_literal: true

require "active_support/core_ext/module/delegation"
require "active_record/base"
require "zeitwerk"
loader = Zeitwerk::Loader.for_gem(warn_on_extra_files: false)
loader.setup
require "who_delegated/railtie"
module WhoDelegated # rubocop:todo Style/Documentation
end
