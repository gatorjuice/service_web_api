Geocoder::Lookup::Test.set_default_stub(
  [
    {
      'coordinates'  => [41.90154, -87.694389],
      'address'      => 'Chicago, IL, USA',
      'state'        => 'Illinois',
      'state_code'   => 'IL',
      'country'      => 'United States',
      'country_code' => 'US'
    }
  ]
)

Geocoder::Lookup::Test.add_stub(
  '2400 N Western Ave, Chicago, IL, 60625', [
    {
      'coordinates'  => [41.9257047, -87.6896371],
      'address'      => 'Chicago, IL, USA',
      'state'        => 'Illinois',
      'state_code'   => 'IL',
      'country'      => 'United States',
      'country_code' => 'US'
    }
  ]
)
