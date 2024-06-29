module ParkingController_tb;

  reg clk;
  reg car_entered;
  reg is_uni_car_entered;
  reg car_exited;
  reg is_uni_car_exited;

  wire [9:0] uni_parked_cars;
  wire [9:0] parked_cars;
  wire [9:0] uni_vacated_space;
  wire [9:0] vacated_space;
  wire uni_is_vacated_space;
  wire is_vacated_space;

  integer i;

  ParkingController uut (
    .clk(clk), 
    .car_entered(car_entered), 
    .is_uni_car_entered(is_uni_car_entered), 
    .car_exited(car_exited), 
    .is_uni_car_exited(is_uni_car_exited), 
    .uni_parked_cars(uni_parked_cars), 
    .parked_cars(parked_cars), 
    .uni_vacated_space(uni_vacated_space), 
    .vacated_space(vacated_space), 
    .uni_is_vacated_space(uni_is_vacated_space), 
    .is_vacated_space(is_vacated_space)
  );

  initial begin
    clk = 1;
    car_entered = 0;
    is_uni_car_entered = 0;
    car_exited = 0;
    is_uni_car_exited = 0;    
    forever #1 clk = ~clk;
  end

  initial begin
    $display("--------------------------------------------------------------Test Part 1--------------------------------------------------------------");
    $display("------------------------------------------------------------Start Time: 08:00----------------------------------------------------------");

    car_entered = 1;
    is_uni_car_entered = 1;
    for (i = 0; i < 600; i=i+1)
        #2;
    is_uni_car_entered = 0;
    for (i = 0; i < 300; i=i+1)
        #2;
    car_entered = 0;

    #2;
    car_exited = 1;
    is_uni_car_exited = 1;
    for (i = 0; i < 600; i=i+1)
        #2;
    is_uni_car_exited = 0;
    for (i = 0; i < 300; i=i+1)
        #2;    
    car_exited = 0;

    $display("--------------------------------------------------------------Test Part 2--------------------------------------------------------------");
    $display("------------------------------------------------------------Start Time: 13:00----------------------------------------------------------");
    #32398;

    car_entered = 1;
    is_uni_car_entered = 1;
    for (i = 0; i < 5; i=i+1)
        #2;
    is_uni_car_entered = 0;
    for (i = 0; i < 5; i=i+1)
        #2;
    car_entered = 0;

    #2;
    car_exited = 1;
    is_uni_car_exited = 1;
    for (i = 0; i < 5; i=i+1)
        #2;
    is_uni_car_exited = 0;
    for (i = 0; i < 5; i=i+1)
        #2;
    car_exited = 0;

    $display("--------------------------------------------------------------Test Part 3--------------------------------------------------------------");
    $display("------------------------------------------------------------Start Time: 14:00----------------------------------------------------------");
    #7158;

    car_entered = 1;
    is_uni_car_entered = 1;
    for (i = 0; i < 5; i=i+1)
        #2;
    is_uni_car_entered = 0;
    for (i = 0; i < 5; i=i+1)
        #2;
    car_entered = 0;

    #2;
    car_exited = 1;
    is_uni_car_exited = 1;
    for (i = 0; i < 5; i=i+1)
        #2;
    is_uni_car_exited = 0;
    for (i = 0; i < 5; i=i+1)
        #2;
    car_exited = 0;

    $display("--------------------------------------------------------------Test Part 4--------------------------------------------------------------");
    $display("------------------------------------------------------------Start Time: 15:00----------------------------------------------------------");
    #7158;

    car_entered = 1;
    is_uni_car_entered = 1;
    for (i = 0; i < 5; i=i+1)
        #2;
    is_uni_car_entered = 0;
    for (i = 0; i < 5; i=i+1)
        #2;
    car_entered = 0;

    #2;
    car_exited = 1;
    is_uni_car_exited = 1;
    for (i = 0; i < 5; i=i+1)
        #2;
    is_uni_car_exited = 0;
    for (i = 0; i < 5; i=i+1)
        #2;
    car_exited = 0;

    $display("--------------------------------------------------------------Test Part 5--------------------------------------------------------------");
    $display("------------------------------------------------------------Start Time: 16:00----------------------------------------------------------");
    #7158;

    car_entered = 1;
    is_uni_car_entered = 1;
    for (i = 0; i < 5; i=i+1)
        #2;
    is_uni_car_entered = 0;
    for (i = 0; i < 5; i=i+1)
        #2;
    car_entered = 0;

    #2;
    car_exited = 1;
    is_uni_car_exited = 1;
    for (i = 0; i < 5; i=i+1)
        #2;
    is_uni_car_exited = 0;
    for (i = 0; i < 5; i=i+1)
        #2;
    car_exited = 0;

    $display("--------------------------------------------------------------Test Part 6--------------------------------------------------------------");
    $display("------------------------------------------------------------Start Time: 08:00----------------------------------------------------------");
    #115170;

    car_entered = 1;
    is_uni_car_entered = 1;
    for (i = 0; i < 600; i=i+1)
        #2;
    is_uni_car_entered = 0;
    for (i = 0; i < 300; i=i+1)
        #2;
    car_entered = 0;

    #34200;

    $stop;
  end

  initial begin
    $monitor("Time: %6d, Uni Parked Cars: %d, Parked Cars: %d, Uni Vacated Space: %d, Vacated Space: %d, Uni Vacancy: %b, Other Vacancy: %b",
             $time, uni_parked_cars, parked_cars, uni_vacated_space, vacated_space, uni_is_vacated_space, is_vacated_space);
  end
      
endmodule