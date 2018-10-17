class Tea
    def flavor
        :earl_grey
    end

    def temperature
        205
    end

    def ingredients
        @ingredients ||= []
      end
    
      def add(ingredient)
        ingredients << ingredient
      end

    def cost
        1.00 + ingredients.size * 1.50
    end

end

RSpec.configure do |config|
    config.example_status_persistence_file_path = 'spec/examples.txt'
end

RSpec.describe Tea do
    let(:tea) { Tea.new }

    it 'taste like Early Grey' do
        expect(tea.flavor).to be :earl_grey
    end

    it 'is hot' do
        expect(tea.temperature).to be > 200.0
    end

    it 'is cost $1' do
        expect(tea.cost).to eq(1.00)
    end

    context 'with honey' do
        before { tea.add :honey }

        it 'cost $2.50' do
            expect(tea.cost).to eq(2.50)
        end
    end

end