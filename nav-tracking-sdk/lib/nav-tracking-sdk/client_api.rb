module NavTracking
  # @api private
  module ClientApi

    include Seahorse::Model

    Empty = Shapes::StructureShape.new(name: 'Empty')
    GetTrackingRequest = Shapes::StructureShape.new(name: 'GetTrackingRequest')
    GetTrackingResponse = Shapes::StructureShape.new(name: 'GetTrackingResponse')
    PostTrackingRequest = Shapes::StructureShape.new(name: 'PostTrackingRequest')
    PostTrackingResponse = Shapes::StructureShape.new(name: 'PostTrackingResponse')
    boolean = Shapes::BooleanShape.new(name: 'boolean')
    double = Shapes::FloatShape.new(name: 'double')
    integer = Shapes::IntegerShape.new(name: 'integer')
    long = Shapes::IntegerShape.new(name: 'long')
    string = Shapes::StringShape.new(name: 'string')
    timestampIso8601 = Shapes::TimestampShape.new(name: 'timestampIso8601', timestampFormat: "iso8601")
    timestampUnix = Shapes::TimestampShape.new(name: 'timestampUnix', timestampFormat: "iso8601")

    Empty.struct_class = Types::Empty

    GetTrackingRequest.struct_class = Types::GetTrackingRequest

    GetTrackingResponse.add_member(:empty, Shapes::ShapeRef.new(shape: Empty, required: true, location_name: "Empty"))
    GetTrackingResponse.struct_class = Types::GetTrackingResponse
    GetTrackingResponse[:payload] = :empty
    GetTrackingResponse[:payload_member] = GetTrackingResponse.member(:empty)

    PostTrackingRequest.struct_class = Types::PostTrackingRequest

    PostTrackingResponse.add_member(:empty, Shapes::ShapeRef.new(shape: Empty, required: true, location_name: "Empty"))
    PostTrackingResponse.struct_class = Types::PostTrackingResponse
    PostTrackingResponse[:payload] = :empty
    PostTrackingResponse[:payload_member] = PostTrackingResponse.member(:empty)


    # @api private
    API = Seahorse::Model::Api.new.tap do |api|

      api.version = "2019-03-30T15:36:13Z"

      api.metadata = {
        "apiVersion" => "2019-03-30T15:36:13Z",
        "endpointPrefix" => "pf6sevgyxa",
        "protocol" => "api-gateway",
        "serviceFullName" => "nav-tracking",
        "serviceId" => "navtracking",
        "uid" => "pf6sevgyxa-2019-03-30T15:36:13Z",
      }

      api.add_operation(:get_tracking, Seahorse::Model::Operation.new.tap do |o|
        o.name = "GetTracking"
        o.http_method = "GET"
        o.http_request_uri = "/development/tracking"
        o['authtype'] = "none"
        o.input = Shapes::ShapeRef.new(shape: GetTrackingRequest)
        o.output = Shapes::ShapeRef.new(shape: GetTrackingResponse)
      end)

      api.add_operation(:post_tracking, Seahorse::Model::Operation.new.tap do |o|
        o.name = "PostTracking"
        o.http_method = "POST"
        o.http_request_uri = "/development/tracking"
        o['authtype'] = "none"
        o.input = Shapes::ShapeRef.new(shape: PostTrackingRequest)
        o.output = Shapes::ShapeRef.new(shape: PostTrackingResponse)
      end)
    end

  end
end
