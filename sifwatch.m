figure;

imagesc(data(:,:,1))
colorbar

for p=1:length(data(1,1,:))    
    imagesc(data(:,:,p),[50 300])
    colorbar
    title(['Frame ',num2str(p), ' of ',num2str(length(data(1,1,:)))])
    pause(0.01)
end