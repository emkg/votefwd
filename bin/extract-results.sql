\copy (SELECT
  voter_id as dwid,
  cohort,
  cw.gender,
  cw.age,
  cw.race,
  cw.name_prefix,
  cw.first_name,
  cw.middle_name,
  cw.last_name,
  cw.name_suffix,
  cw.registration_address_line_1,
  cw.registration_address_line_2,
  cw.registration_address_city,
  cw.registration_address_state,
  cw.registration_address_zip,
  cw.registration_address_zip_plus_4,
  cw.mail_address_line_1,
  cw.mail_address_line_2,
  cw.mail_address_city,
  cw.mail_address_state,
  cw.mail_address_zip,
  cw.mail_address_zip_plus_4,
  likely_cell,
  likely_landline,
  adopted_at,
  confirmed_prepped_at,
  confirmed_sent_at,
  pledge_made_at
FROM experiment_voter ev
LEFT JOIN voters v ON ev.voter_id=v.registration_id
JOIN catalist_raw cw on ev.voter_id=cw.dwid
WHERE experiment_id IN ('1', '10')
TO '/users/scott/Projects/votefwd/results/oh12_universe.csv' WITH CSV DELIMITER ',';
