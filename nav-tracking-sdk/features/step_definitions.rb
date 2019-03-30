Before("@navtracking") do
  @service = NavTracking::Resource.new
  @client = @service.client
end

After("@navtracking") do
  # shared cleanup logic
end
