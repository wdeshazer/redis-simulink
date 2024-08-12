typedef enum {
  PWR_LOSS = 0,                 /* Default value */
  OVERSPD,
  PRESS_LOW,
} fault_T;

typedef struct {
    double coeff;
    double init;
} params_T;