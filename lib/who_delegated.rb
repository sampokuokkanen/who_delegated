# frozen_string_literal: true

require "active_record/base"
require "active_support/core_ext/module/delegation"
require "who_delegated/railtie"
require "zeitwerk"
loader = Zeitwerk::Loader.for_gem(warn_on_extra_files: false)
loader.setup

module WhoDelegated # rubocop:todo Style/Documentation
end
