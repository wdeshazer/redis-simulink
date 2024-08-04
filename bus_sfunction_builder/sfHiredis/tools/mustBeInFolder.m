% Custom validation function
function mustBeInFolder(folder,item)
    % Checks if Folder_path is in Folder
    arguments
        folder {mustBeFolder}
        item string
    end
    if ~isfolder(fullfile(folder, item))
        eid = 'Folder:notInPath';
        msg = '%s was not found in Base Folder.';
        msg = msg + sprintf('Base Folder:\n\t%', folder);
        error(eid,msg)
    end
end