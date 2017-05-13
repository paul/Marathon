


for tech_name, tech_obj in pairs(data.raw.technology) do
  local l = #tech_name
  if string.sub(tech_name,1,7) == 'angels-' and string.sub(tech_name,l-10+1,l) == 'smelting-1' then
    local metal = string.sub(tech_name, 8, l-10)
    if data.raw.technology[metal .. '-processing'] then
      -- add it to prerequisites
      tech_obj.prerequisites ?????
