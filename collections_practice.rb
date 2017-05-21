def begins_with_r(array)
  array.each { |val| return false if !val.start_with?("r")}
  true
end

def contain_a(array)
  array.select { |val| val.include?("a")}
end

def first_wa(array)
  array.find { |val| val.to_s.start_with?("wa")}
end

def remove_non_strings(array)
  array.delete_if { |val| !val.is_a?(String)}
end

def count_elements(array)
  (array.map { |val| {:name => val[:name], :count => array.count(val)}}).uniq
end

def merge_data(enum1, enum2)
  # if value in first enum matches a key in the second one, add it as a value for :first_name key in new hash, add keys from second enum as
  # values in the new hash, and shovel the new hash into a new array, which we return
  return_values = []
  enum2.each { |nested_hash2|
    nested_hash2.each { |key2, value2|
      enum1.each { |nested_hash1|
        if nested_hash1.value?(key2)
          new_hash = {:first_name => key2}
          value2.each { |key, value| new_hash[key] = value}
          return_values << new_hash
        end
      }
    }
  }
  return_values
end

def find_cool(array_of_hashes)
  array_of_hashes.select { |hash| hash.value?("cool")}
end

def organize_schools(schools)
  organized_schools = {}
  schools.each { |school, location_hash|
    location = location_hash[:location]
    organized_schools.key?(location) ? organized_schools[location] << school : organized_schools[location] = [school]
  }
  organized_schools
end
