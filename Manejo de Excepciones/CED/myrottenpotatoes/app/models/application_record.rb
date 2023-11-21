class ApplicationRecord < ActiveRecord::Base
  primary_abstract_class

  class ApplicationError < StandardError; end
  class ValidationError < ApplicationError; end
  class ResponseError < ApplicationError; end
end

