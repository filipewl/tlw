RSpec.describe "Smallest Temperature Spread CLI" do
  it "prints the day with the smallest temperature spread" do
    sample_file = "data/w_dataa.dat"
    output = `bin/smallest_temperature_spread #{sample_file}`

    expect(output).to include("Day with the smallest temperature spread: 14")
    expect(output).to include("Smallest temperature spread: 2 (Max 61 - Min 59")
  end

  it "prints an error message if no file path is provided" do
    output = `bin/smallest_temperature_spread`

    expect(output).to include("Usage: smallest_temperature_spread <file_path>")
  end

  it "prints an error message if the file does not exist" do
    output = `bin/smallest_temperature_spread data/non_existent.dat`

    expect(output).to include("File not found")
  end
end
