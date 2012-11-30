require 'test_helper'

class JobOffersControllerTest < ActionController::TestCase
  def test_index
    get :index
    assert_template 'index'
  end

  def test_show
    get :show, :id => JobOffer.first
    assert_template 'show'
  end

  def test_new
    get :new
    assert_template 'new'
  end

  def test_create_invalid
    JobOffer.any_instance.stubs(:valid?).returns(false)
    post :create
    assert_template 'new'
  end

  def test_create_valid
    JobOffer.any_instance.stubs(:valid?).returns(true)
    post :create
    assert_redirected_to job_offer_url(assigns(:job_offer))
  end

  def test_edit
    get :edit, :id => JobOffer.first
    assert_template 'edit'
  end

  def test_update_invalid
    JobOffer.any_instance.stubs(:valid?).returns(false)
    put :update, :id => JobOffer.first
    assert_template 'edit'
  end

  def test_update_valid
    JobOffer.any_instance.stubs(:valid?).returns(true)
    put :update, :id => JobOffer.first
    assert_redirected_to job_offer_url(assigns(:job_offer))
  end

  def test_destroy
    job_offer = JobOffer.first
    delete :destroy, :id => job_offer
    assert_redirected_to job_offers_url
    assert !JobOffer.exists?(job_offer.id)
  end
end
