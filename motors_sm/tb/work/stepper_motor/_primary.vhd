library verilog;
use verilog.vl_types.all;
entity stepper_motor is
    generic(
        bits_pwm        : integer := 8
    );
    port(
        in_clk          : in     vl_logic;
        in_rst          : in     vl_logic;
        in_dir          : in     vl_logic;
        in_en           : in     vl_logic;
        in_cycles       : in     vl_logic_vector(9 downto 0);
        out_PWM         : out    vl_logic_vector(3 downto 0)
    );
    attribute mti_svvh_generic_type : integer;
    attribute mti_svvh_generic_type of bits_pwm : constant is 1;
end stepper_motor;
