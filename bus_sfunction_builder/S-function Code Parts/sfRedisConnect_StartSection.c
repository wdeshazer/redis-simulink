  int i = 0; int j = 0;
  char buffer[120];

  char *fmt = "Input Value '(%d, %d)' is '%g'\n";

  int u_length = sizeof(*(u[0])

  for (i=0; i < u_width; i++) {
    for (j=0; j < u_length; j++) {
      yj[j] = uj[j];
      sprintf(buffer, fmt, i, j, uj[j]);
      ssWarning(S, buffer);
      strcpy(buffer, "");
      }

  }

  if (ssGetPWork(S) != NULL) {
    redisContext *ctx = (redisContext *) ssGetPWorkValue(S,0);
    if (ctx == NULL) {
        char buffer[120];
        sprintf(buffer, "Redis connection information not visible sfRedis_Outputs");
        ssSetErrorStatus(S, buffer);
    }
    ssSetPWorkValue(S,0,NULL);
  }
