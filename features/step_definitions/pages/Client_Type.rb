class Client_Type
  include Capybara::DSL

  def select_vendor
    check("isVendor")
  end

  def select_buyer
    check("isBuyer")
  end

  def select_vendor_rating
    select "low", :from => "vendorRating_id"
  end

  def select_buyer_rating
    select "low", :from => "buyerRating_id"
  end

  def select_vendor_source
    select "Referral", :from => "vendorClientSource_id"
  end

  def select_buyer_source
    select "Referral", :from => "buyerClientSource_id"
  end

  def select_vendor_staff
    select "Tony Horn", :from => "vendorStaffID"
  end

  def select_buyer_staff
    select "Tony Horn", :from => "buyerStaffID"
  end

  def select_category
    #this is a radio button, select by value
    find(:field, 'client_category', with: 'company').click
  end

  def click_next
    find(".ppBtn").click
  end

end