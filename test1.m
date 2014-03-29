function []=test1(test2,a)
clc
test2=rand(10,10)
a=3
[row,col]=size(test2)
for i=1:row
    for j=1:col
        
        if i>=a/2+1 && i<=row-(a/2) && j>=a/2+1 && j<=col-(a/2)
            % 取出窗口内栅格值
            win_a_a=test2(i-a/2:i+a/2,j-a/2:j+a/2);
            
            %找出最大高差栅格位置和高差值
            max_value=0;
            max_i=0;
            max_j=0;
            for I=1:a
                for J=1:a
                    center_i=fix(a/2)+1;
                    center_j=fix(a/2)+1;
                    if I~=center_i && J~=center_j
                        if win_a_a(center_i,center_j)-win_a_a(I,J)>max_value
                            max_value=win_a_a(center_i,center_j)-win_a_a(I,J);
                            max_i=I;
                            max_j=J;
                        end
                    end
                end
            end
            % 计算坡度
%             tan theta= h/dis
            theta=atan(max_value/sqrt((center_i-max_i)*(center_i-max_i)+(center_j-max_j)*(center_j-max_j)));
            slope(i,j)=theta;
%             disp(win_a_a)
%             disp(i)
%             disp(j)
        elseif i<=a/2
            slope(i,:)=-1;
        elseif i>=row-a/2+1
            slope(i,:)=-1;
        elseif j<=a/2
            slope(:,j)=-1;
        elseif j>=col-a/2+1
            slope(:,j)=-1;
        end
    end
end
size(slope)
disp(slope);


end