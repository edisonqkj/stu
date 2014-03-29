function []=test1(test2,a)
clc;
test2=rand(10,10)
a=3;
wid=fix(a/2);
[row,col]=size(test2);
for i=1:row
    for j=1:col
        
        if i>=wid+1 && i<=row-wid && j>=wid+1 && j<=col-wid
            % 取出窗口内栅格值
            win_a_a=test2(i-wid:i+wid,j-wid:j+wid);
            
            %找出最大高差栅格位置和高差值
            max_value=0;
            max_i=0;
            max_j=0;
            for I=1:a
                for J=1:a
                    center_i=wid+1;
                    center_j=wid+1;
                    if I~=center_i && J~=center_j
                        if abs(win_a_a(center_i,center_j)-win_a_a(I,J))>max_value
                            max_value=abs(win_a_a(center_i,center_j)-win_a_a(I,J));
                            max_i=I;
                            max_j=J;
                        end
                    end
                end
            end
            % 计算坡度
%             tan theta= h/dis
            theta=atan(max_value/sqrt(...
                (center_i-max_i)*(center_i-max_i)+...
                (center_j-max_j)*(center_j-max_j)))*180/pi;
            slope(i,j)=theta;
%             if i==3 && j==2
%                 disp(win_a_a);
%                 disp(theta);
%                 disp([max_i,max_j]);
%                 disp(slope(i,j));
%             end
%             disp(win_a_a)
%             disp(i)
%             disp(j)
        elseif i<=wid
            slope(i,j)=-1;
        elseif i>=row-wid+1
            slope(i,j)=-1;
        elseif j<=wid
            slope(i,j)=-1;
        elseif j>=col-wid+1
            slope(i,j)=-1;
        end
    end
end
size(slope);
disp(slope);


end