fp = "/Users/jim/Documents/repos/matlab/example_sas_data_files/sas7bdat_sources_rdata.xlsx";
save_root = "/Users/jim/Documents/repos/matlab/example_sas_data_files/sas7bdat";
t = readtable(fp);

mask = false(height(t),1);
for i = 1:height(t)
    fprintf('%d:%d\n',i,height(t));
    url = t.url{i};
    file_name = t.filename{i};

    save_path = fullfile(save_root,file_name);

    try
        %urlwrite(url,save_path);
        websave(save_path,url)
        mask(i) = true;
    catch

    end
end

mask = false(height(t),1);
for i = 1:height(t)
    file_name = t.filename{i};

    save_path = fullfile(save_root,file_name);
    mask(i) = exist(save_path,'file');

end

filename = string(t.filename(mask));
url = string(t.url(mask));
t2 = table(filename,url);