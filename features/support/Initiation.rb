  require 'debugger'
  require '.\features\step_definitions\pages\Control_Panel'
  require '.\features\step_definitions\pages\Client_Manager'
  require '.\features\step_definitions\pages\Client_Type'
  require '.\features\step_definitions\pages\Client_Form'
  require '.\features\step_definitions\pages\Vendor_Page'
  require '.\features\step_definitions\pages\Home_Page'
  require '.\features\step_definitions\pages\Property_Form'
  require '.\features\step_definitions\pages\Create_Property_Page'
  require '.\features\step_definitions\pages\Image_Uploader'
  require '.\features\step_definitions\pages\Residential_Page'
  require '.\features\step_definitions\pages\Listing_Rules'
  require '.\features\step_definitions\pages\Edit_Status'
  require '.\features\step_definitions\pages\Ofi_Form'
  require '.\features\step_definitions\pages\Appraisal_Form'
  require '.\features\step_definitions\pages\Appraisal_Rules'
  require '.\features\step_definitions\pages\Appraisal_Page'
  require '.\features\step_definitions\pages\Appraisal_Status'
  require '.\features\step_definitions\pages\Ofi_Feedback_Form'
  require '.\features\step_definitions\pages\Enquiries_Form'
  require '.\features\step_definitions\pages\Inspection_Form'
  require '.\features\step_definitions\pages\Newsletter_Form'
  require '.\features\step_definitions\pages\Referral_Form'

  puts "My browser is " + $brw
  $home_page = Home_Page.new
  $control_panel = Control_Panel.new
  $client_form = Client_Form.new
  $client_manager = Client_Manager.new
  $client_type = Client_Type.new
  $vendor_page = Vendor_Page.new
  $create_property = Create_Property_Page.new
  $property_form = Property_Form.new
  $image_uploader = Image_Uploader.new
  $residential_page = Residential_Page.new
  $listing_rules = Listing_Rules.new
  $edit_status = Edit_Status.new
  $ofi_form = Ofi_Form.new
  $appraisal_form = Appraisal_Form.new
  $appraisal_rules = Appraisal_Rules.new
  $appraisal_page = Appraisal_Page.new
  $appraisal_status = Appraisal_Status.new
  $ofi_feedback_form = Ofi_Feedback_Form.new
  $enquiries_form = Enquiries_Form.new
  $inspection_form = Inspection_Form.new
  $newsletter_form = Newsletter_Form.new
  $referral_form = Referral_Form.new