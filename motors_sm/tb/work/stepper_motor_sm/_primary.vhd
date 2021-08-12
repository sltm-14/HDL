library verilog;
use verilog.vl_types.all;
entity stepper_motor_sm is
    port(
        clk             : in     vl_logic;
        rst             : in     vl_logic;
        dir             : in     vl_logic;
        en              : in     vl_logic;
        i_Cycles        : in     vl_logic_vector(9 downto 0);
        outA            : out    vl_logic_vector(7 downto 0);
        outB            : out    vl_logic_vector(7 downto 0);
        outC            : out    vl_logic_vector(7 downto 0);
        outD            : out    vl_logic_vector(7 downto 0)
    );
end stepper_motor_sm;
