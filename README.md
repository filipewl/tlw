# Smallest Weather Spread CLI

This CLI tool processes weather data from a `.dat` file and finds the day with the smallest temperature spread. 

## Usage

### Running the Script

You can run the script in two ways:

#### 1. Make the Script Executable

First, ensure the script is executable. You can make the script executable by running:

```sh
chmod +x bin/smallest_temperature_spread
```

Then, you can execute the script directly from the terminal:

```sh
bin/smallest_temperature_spread data/w_dataa.dat
```

#### 2. Run with Ruby Directly

If you prefer not to change file permissions, you can run the script using the Ruby interpreter directly:

```sh
ruby bin/smallest_temperature_spread data/w_dataa.dat
```

## Running the tests

Install the dependencies with Bundler:

```sh
bundle install
```

Run the tests with RSpec:

```sh
bundle exec rspec
```
