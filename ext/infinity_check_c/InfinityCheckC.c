// Include the Ruby headers and goodies
#include "ruby.h"
#include "math.h"
#include "complex.h"

// Defining a space for information and references about the module to be stored internally
VALUE InfinityCheckC = Qnil;

// Prototype for the initialization method - Ruby calls this, not you
void Init_infinity_check_c();

// Prototype for our method - methods are prefixed by 'method_' here
VALUE method_infinity_check_c(VALUE self, VALUE limit, VALUE cr, VALUE ci, VALUE zr, VALUE zi);

// The initialization method for this module
void Init_infinity_check_c()
{
	InfinityCheckC = rb_define_module("InfinityCheckC");
	rb_define_method(InfinityCheckC, "infinity_check_c", method_infinity_check_c, 5);
}

VALUE method_infinity_check_c(VALUE self, VALUE limit, VALUE cr, VALUE ci, VALUE zr, VALUE zi)
{
    float complex c = NUM2DBL(cr) + NUM2DBL(ci) * I;
    float complex z = NUM2DBL(zr) + NUM2DBL(zi) * I;
    int iteration_limit = FIX2INT(limit);
	int i = -1;
	int j;

	for (j = 0; j < iteration_limit; j++)
	{
	    z = z * z + c;
	    double a = cabs(z);

	    if (a > 4.0f)
	    {
	        break;
	    }

	    i++;
	}

	return INT2FIX(i);
}
