function people(db_file, mode, varargin)
    switch mode
        case 'reset'
            % 重置数据库
            database = struct('Name', {}, 'Age', {});
            save(db_file, 'database');
            fprintf('Database has been reset.\n');
        case 'list'
            % 显示数据库内容
            load(db_file, 'database');
            fprintf('Database contents:\n');
            for i = 1:length(database)
                fprintf('Name: %s, Age: %d\n', database(i).Name, database(i).Age);
            end
        case 'insert'
            % 插入新条目
            load(db_file, 'database');
            numArgs = length(varargin);
            for i = 1:2:numArgs
                name = varargin{i};
                age = varargin{i + 1};
                newEntry = struct('Name', name, 'Age', age);
                database(end + 1) = newEntry;
            end
            save(db_file, 'database');
            fprintf('New items inserted into the database.\n');
        case 'remove'
            % 从数据库中移除条目
            load(db_file, 'database');
            numArgs = length(varargin);
            for i = 1:2:numArgs
                name = varargin{i};
                age = varargin{i + 1};
                index = find(strcmp({database.Name}, name) & [database.Age] == age);
                if ~isempty(index)
                    database(index) = [];
                end
            end
            save(db_file, 'database');
            fprintf('Items removed from the database.\n');
        otherwise
            fprintf('Invalid mode. Supported modes are ''reset'', ''list'', ''insert'', and ''remove''.\n');
    end
end

