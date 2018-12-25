class AddStartingResources < SeedMigration::Migration
  def up
    resources.each do |resource|
      Resource.create!(resource)
    end
  end

  def down
    Resource.destroy_all!
  end

  private

  def resources
    [
      {
        name: 'Lincoln Square Friendship CTN',
        phone: '7739076388',
        description: 'food place',
        street: '2711 W Lawrence',
        city: 'Chicago',
        state: 'IL',
        zipcode: '60625',
        food: true
      },
      {
        name: 'Heartland Health Outreach',
        phone: '7732752586',
        description: 'description',
        street: '1015 W Lawrence',
        city: 'Chicago',
        state: 'IL',
        zipcode: '60640',
        health: true
      },
      {
        name: 'Pacific Garden Mission',
        phone: '3124929410',
        description: 'PURPOSE: To reach the lost with the Gospel of Christ. MISSION STATEMENT: We serve with the compassion of Christ and minister with the transforming message of the Gospel. VISION: We offer life answers through faith in Jesus Christ, through any season of life, so that our guests become fully functioning followers of Christ. CORE VALUES: Faith • The Word • Truth • Love',
        street: '1458 S Canal',
        city: 'Chicago',
        state: 'IL',
        zipcode: '60607',
        shelter: true
      }
    ]
  end
end
