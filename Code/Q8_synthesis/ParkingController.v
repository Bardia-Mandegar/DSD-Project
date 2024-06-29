module ParkingController (
    input clk,
    input car_entered,
    input is_uni_car_entered,
    input car_exited,
    input is_uni_car_exited,
    output reg [9:0] uni_parked_cars,
    output reg [9:0] parked_cars,
    output reg [9:0] uni_vacated_space,
    output reg [9:0] vacated_space,
    output uni_is_vacated_space,
    output is_vacated_space
);

integer second;
integer total_others_space;

initial begin
    second  = 8 * 3600;
    uni_parked_cars = 0;
    parked_cars = 0;
    uni_vacated_space = 500;
    vacated_space = 200;
    total_others_space = 200;
end

assign uni_is_vacated_space = (uni_vacated_space > 0);
assign is_vacated_space = (vacated_space > 0);

always @(posedge clk) begin
    if (second % 3600 == 0)
        if (second == (24 + 8) * 3600) begin
            second  = 8 * 3600;
            total_others_space = 200;
            uni_vacated_space = 700 - total_others_space - uni_parked_cars;
            parked_cars = (parked_cars > total_others_space) ? total_others_space : parked_cars;
            vacated_space = total_others_space - parked_cars;            
        end
        else if (second == 13 * 3600 || second == 14 * 3600 || second == 15 * 3600)
            total_others_space = total_others_space + 50;
        else if (second == 16 * 3600)
            total_others_space = total_others_space + 150;
        uni_parked_cars = (uni_parked_cars > 700 - total_others_space) ? (700 - total_others_space) : uni_parked_cars;
        uni_vacated_space = 700 - total_others_space - uni_parked_cars;
        vacated_space = total_others_space - parked_cars;

    second = second + 1;

    if (car_entered) begin
        if (is_uni_car_entered && uni_vacated_space > 0) begin
            uni_parked_cars = uni_parked_cars + 1;
            uni_vacated_space = uni_vacated_space - 1;
        end
        else if (~is_uni_car_entered && vacated_space > 0) begin
            parked_cars = parked_cars + 1;
            vacated_space = vacated_space - 1;
        end
    end

    if (car_exited) begin
        if (is_uni_car_exited && uni_parked_cars > 0) begin
            uni_parked_cars = uni_parked_cars - 1;
            uni_vacated_space = uni_vacated_space + 1;
        end
        else if (~is_uni_car_exited && parked_cars > 0) begin
            parked_cars = parked_cars - 1;
            vacated_space = vacated_space + 1;
        end
    end
end

endmodule