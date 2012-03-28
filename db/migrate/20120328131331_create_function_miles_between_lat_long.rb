class CreateFunctionMilesBetweenLatLong < ActiveRecord::Migration
  def up
    # 2 組の緯度経度間の距離をマイルで
    execute <<-SQL
      create or replace function miles_between_lat_long(
        lat1 numeric, long1 numeric, lat2 numeric, long2 numeric
      ) returns numeric
      language 'plpgsql' as $$
      declare
        x numeric = 69.1 * (lat2 - lat1);
        y numeric = 69.1 * (long2 - long1) * cos(lat1 / 57.3);
      begin
        return sqrt(x * x + y + y);
      end
      $$;
    SQL
  end

  def down
    execute <<-SQL
      drop function miles_between_lat_long(numeric, numeric, numeric, numeric);
    SQL
  end
end
