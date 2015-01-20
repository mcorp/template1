require 'rails_helper'

RSpec.describe Template1::Rails::BootstrapHelper, :type => :helper do
  context '.bootstrap_class_for' do
    # as symbol
    it { expect(helper.bootstrap_class_for(:success)).to  eq('alert-success') }
    it { expect(helper.bootstrap_class_for(:error)).to    eq('alert-danger')  }
    it { expect(helper.bootstrap_class_for(:alert)).to    eq('alert-warning') }
    it { expect(helper.bootstrap_class_for(:notice)).to   eq('alert-info')    }
    # as string
    it { expect(helper.bootstrap_class_for('success')).to eq('alert-success') }
    it { expect(helper.bootstrap_class_for('error')).to   eq('alert-danger')  }
    it { expect(helper.bootstrap_class_for('alert')).to   eq('alert-warning') }
    it { expect(helper.bootstrap_class_for('notice')).to  eq('alert-info')    }
    # unknown item
    it { expect(helper.bootstrap_class_for(:unknown)).to  eq('unknown')       }
    it { expect(helper.bootstrap_class_for('unknown')).to eq('unknown')       }
  end

  context '.flash_messages' do
    it 'render html' do
      flash[:flash_key] = 'flash message'

      rendered_view = render(inline: '<%= flash_messages %>')

      expect(helper.flash_messages).to be_nil
      expect(rendered_view).to eq '<div class="alert flash_key" role="alert"><button class="close" data-dismiss="alert">x</button>flash message</div>'
    end
  end
end
