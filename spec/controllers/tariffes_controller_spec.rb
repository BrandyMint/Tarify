require 'spec_helper'

describe TariffesController do

  describe "GET 'show'" do
    let(:tariffe) { create :tariffe }
    it "returns http success" do
      get 'show', id: tariffe.id
      response.should be_success
    end
  end

end
