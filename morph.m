function [ data ] = morph( x1, y1, x2, y2, data )
%UNTITLED4 Summary of this function goes here
    spike_factor = 1;

    midx = ceil((x2-x1)/2+x1);
    midy = ceil((y2-y1)/2+y1);
    %fprintf('x1:%i, mid:%i, x2:%i\n ', y1, midx, y2)
    
    if (data(midx, y1) ==0)
    data(midx, y1) = (data(x1, y1)+data(x2, y1))/2 + (rand-0.5)*(x2-x1)*spike_factor/length(data);
    end
    if(data(midx, y2) == 0)
    data(midx, y2) = (data(x1, y2)+data(x2, y2))/2 + (rand-0.5)*(x2-x1)*spike_factor/length(data);
    end
    if(data(x1, midy) == 0)
    data(x1, midy) = (data(x1, y1)+data(x1, y2))/2 + (rand-0.5)*(y2-y1)*spike_factor/length(data);
    end
    if(data(x2, midy) == 0)
    data(x2, midy) = (data(x2, y1)+data(x2, y2))/2 + (rand-0.5)*(y2-y1)*spike_factor/length(data);
    end

    data(midx, midy) = (data(midx, y1)+ data(midx, y2) + data(x1, midy) + data(x2, midy))/4;
    if(x2-midx > 1)
        data = morph(x1, y1, midx, midy, data);
        data = morph(x1, midy, midx, y2, data);
        data = morph(midx, y1, x2, midy, data);
        data = morph(midx, midy, x2, y2, data);
    end
    
end
