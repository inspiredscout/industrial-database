CREATE TABLE room_types (
    room_type_id SERIAL PRIMARY KEY,
    room_type_name VARCHAR(255)
    -- Другие поля таблицы
);


CREATE TABLE real_estate_structure (
    real_estate_object_id INT,
    room_type_id INT,
    area REAL CHECK (area > 0),
    FOREIGN KEY (real_estate_object_id) REFERENCES real_estate_objects(object_id),
    FOREIGN KEY (room_type_id) REFERENCES room_types(room_type_id)
);



-- 1. Добавить внешние ключи в необходимые таблицы.
ALTER TABLE real_estate_objects
ADD CONSTRAINT fk_district_id
FOREIGN KEY (district_id)
REFERENCES districts (district_id);

ALTER TABLE real_estate_objects
ADD CONSTRAINT fk_type_id
FOREIGN KEY (type_id)
REFERENCES property_types (type_id);

ALTER TABLE real_estate_objects
ADD CONSTRAINT fk_material_id
FOREIGN KEY (material_id)
REFERENCES building_materials (material_id);

-- 2. В таблице «Объекты недвижимости» добавить ограничение на столбец «Статус»: 1 или 0.
ALTER TABLE real_estate_objects
ADD CONSTRAINT check_status
CHECK (status = 1 OR status = 0);

-- 3. Поменять в таблице «Объекты недвижимости» типы столбцов «Площадь» и «Стоимость» на вещественный.
ALTER TABLE real_estate_objects
ALTER COLUMN area TYPE REAL;

ALTER TABLE real_estate_objects
ALTER COLUMN cost TYPE REAL;

-- 4. Для столбца «Дата объявления» в таблице «Объекты недвижимости» установить значение по умолчанию – текущая дата.
ALTER TABLE real_estate_objects
ALTER COLUMN posting_date SET DEFAULT CURRENT_DATE;

-- 5. В таблицу «Объекты недвижимости» добавить столбец «Класс жилья» со значениями по умолчанию.
ALTER TABLE real_estate_objects
ADD COLUMN housing_class VARCHAR(10) DEFAULT 'Эконом';



-- 8. В таблицу «Продажа» добавить столбец «Комиссия риэлтору» типа вещественный.
ALTER TABLE sales
ADD COLUMN realtor_commission REAL;

-- 9. Для столбца "Комиссия риэлтору" в таблице "Продажа" добавить значение по умолчанию - 10.
ALTER TABLE sales
ALTER COLUMN realtor_commission SET DEFAULT 10;

-- 10. Для столбца «Код объекта» в таблице «Продажи» добавить ограничение уникальности.
ALTER TABLE sales
ADD CONSTRAINT unique_object_id
UNIQUE (object_id);

-- 11. Настроить ссылочную целостность таким образом, чтобы при удалении риэлтора, в таблице «Продажи» столбцу «Код риэлтора» присваивалось значение «null».


-- 12. В таблице «Оценки» добавить ограничение столбца «Оценка»: от 0 до 10.
ALTER TABLE evaluations
ADD CONSTRAINT check_evaluation
CHECK (evaluation >= 0 AND evaluation <= 10);

-- 13. Настроить ссылочную целостность таким образом, чтобы при удалении критерия оценки, в таблице «Оценки» столбцу «Код критерия» присваивалось значение по умолчанию.
ALTER TABLE evaluations
ADD CONSTRAINT fk_criterion_id
FOREIGN KEY (criterion_id) REFERENCES evaluation_criteria(criterion_id)
ON DELETE SET DEFAULT;



-- 14. Добавить ограничение уникальности на комбинацию Фамилия, Имя, Отчество в таблице «Риэлтор».
ALTER TABLE realtors
ADD CONSTRAINT unique_realtor_name
UNIQUE (last_name, first_name, patronymic);

-- 15. Выполнить запрос для переименования столбца.
ALTER TABLE building_materials
RENAME COLUMN material_name TO iz_chego;
