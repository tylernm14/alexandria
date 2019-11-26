# app/presenters/base_presenter_old.rb
class BasePresenterOld
  # Define a class level instance variable
  @relations = []
  @sort_attributes = []
  @filter_attributes = []
  @build_attributes = []

  # Open the door to class methods
  class << self
    # Define an accessor for the class level instance
    # variable we created above
    attr_accessor :relations, :sort_attributes,
                  :filter_attributes, :build_attributes

    # create the actual class method that will be used
    # in the subclasses.  We use the splash operator '*'
    # to get all the arguments passed in an array
    def build_with(*args)
      @build_attributes = args.map(&:to_s)
    end

    def related_to(*args)
      @relations = args.map(&:to_s)
    end

    def sort_by(*args)
      @sort_attributes = args.map(&:to_s)
    end

    def filter_by(*args)
      @filter_attributes = args.map(&:to_s)
    end
  end

  attr_accessor :object, :params, :data

  def initialize(object, params, options = {})
    @object = object
    @params = params
    @options = options
    @data = HashWithIndifferentAccess.new
  end

  def as_json(*)
    @data
  end
end