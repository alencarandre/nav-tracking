module NavTracking
  module Types

    class Empty < Aws::EmptyStructure; end

    # @api private
    #
    class GetTrackingRequest < Aws::EmptyStructure; end

    # @!attribute [rw] empty
    #   @return [Types::Empty]
    #
    class GetTrackingResponse < Struct.new(
      :empty)
      include Aws::Structure
    end

    # @api private
    #
    class PostTrackingRequest < Aws::EmptyStructure; end

    # @!attribute [rw] empty
    #   @return [Types::Empty]
    #
    class PostTrackingResponse < Struct.new(
      :empty)
      include Aws::Structure
    end

  end
end
