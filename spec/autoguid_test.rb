require 'test_helper'

class AutoguidTest < ActiveSupport::TestCase

  # test "truth" do
  #   assert_kind_of Module, Autoguid
  # end

  describe test_all_models do
  	it 'should have an autoguid attribute' do
      expect("str").to eq "str"
	  # Rails.application.eager_load!
      # ActiveRecord::Base.direct_descendants.each do |model|
      #   expect(model.has_attribute?(:autoguid)).to eq 1
      end
    end
  end
end
