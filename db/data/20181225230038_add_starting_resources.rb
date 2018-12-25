class AddStartingResources < SeedMigration::Migration
  def up
    Resource.create!(
      name: 'Pacific Garden Mission',
      description: 'PURPOSE: To reach the lost with the Gospel of Christ. MISSION STATEMENT: We serve with the compassion of Christ and minister with the transforming message of the Gospel. VISION: We offer life answers through faith in Jesus Christ, through any season of life, so that our guests become fully functioning followers of Christ. CORE VALUES: Faith • The Word • Truth • Love',
      street: '1458 S Canal',
      city: 'Chicago',
      state: 'IL',
      zipcode: '60607',
      shelter: true
    )
  end

  def down
    Resource.destroy_all!
  end
end
