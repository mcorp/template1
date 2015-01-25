require 'rails_helper'

RSpec.describe Template1::Rails::FormActionHelper, :type => :helper do

  context '.form_action_icon' do
    it { expect(helper.form_action_icon(:delete)).to eq('<i class="fa fa-trash-o"></i>') }
    it { expect(helper.form_action_icon(:view)).to   eq('<i class="fa fa-eye"></i>')     }
    it { expect(helper.form_action_icon(:edit)).to   eq('<i class="fa fa-edit"></i>')    }
  end

  context '.form-action-class' do
    it { expect(helper.form_action_class(:delete)).to eq('form-action action-danger')  }
    it { expect(helper.form_action_class(:view)).to   eq('form-action action-primary') }
    it { expect(helper.form_action_class(:edit)).to   eq('form-action action-warning') }
  end

  context '.form_action_path' do
    # FIXME: find a way to make this test pass as we don't have the model here
    pending 'fix tests'
    # let(:model) { Contact.new(id: 100) }

    # it { expect(helper.form_action_path delete: model).to eq('/contacts/100')      }
    # it { expect(helper.form_action_path view:   model).to eq('/contacts/100')      }
    # it { expect(helper.form_action_path edit:   model).to eq('/contacts/100/edit') }
  end

  context '.form_action' do
    def run_form_action(action)
      model = Object.new
      action_model = { action => model }

      allow(helper).to receive(:form_action_path).with(action_model).and_return('/mock/')
      helper.form_action action_model
    end

    it { expect(run_form_action(:delete)).to eq("<a class=\"form-action action-danger\" data-confirm=\"Você tem certeza?\" rel=\"nofollow\" data-method=\"delete\" href=\"/mock/\"><i class=\"fa fa-trash-o\"></i></a>") }
    it { expect(run_form_action(:view)).to   eq("<a class=\"form-action action-primary\" href=\"/mock/\"><i class=\"fa fa-eye\"></i></a>")  }
    it { expect(run_form_action(:edit)).to   eq("<a class=\"form-action action-warning\" href=\"/mock/\"><i class=\"fa fa-edit\"></i></a>") }
  end

end
