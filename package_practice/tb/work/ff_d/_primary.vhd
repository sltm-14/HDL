library verilog;
use verilog.vl_types.all;
entity ff_d is
    port(
        clk             : in     vl_logic;
        rst             : in     vl_logic;
        i_data          : in     vl_logic_vector(3 downto 0);
        o_data          : out    vl_logic_vector(3 downto 0)
    );
end ff_d;
