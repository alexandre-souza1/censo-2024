require "test_helper"

class SurveyCodesControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get survey_codes_index_url
    assert_response :success
  end

  test "should get import" do
    get survey_codes_import_url
    assert_response :success
  end
end
