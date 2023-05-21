% Data: https://dandiarchive.org/dandiset/000207/draft
%
% Code by Jie Zheng and Ueli Rutishauser, December 2021
% See paper: Zheng et al., Nat Neurosci, 2022.
%
%forked from +util/read_indexed_column.m
%
%urut/jan'19
function data = nwb_read_unit(vector_index, vector_data, row)
%READ_INDEXED_COLUMN returns the data for a specific row of an indexed vector
%
%   DATA = READ_INDEXED_COLUMN(VECTOR_INDEX, ROW) takes a VectorIndex from a
%   DynamicTable and a ROW number and outputs the DATA for that row (1-indexed).

vector_index = vector_index.data.load;

upper_bound = vector_index(row);

if row == 1
    lower_bound = 1;
else
    lower_bound = vector_index(row - 1) + 1;
end

%%
% Then select the corresponding spike_times_index element
dataAll = vector_data.data.load;
data = dataAll(lower_bound:upper_bound);
end