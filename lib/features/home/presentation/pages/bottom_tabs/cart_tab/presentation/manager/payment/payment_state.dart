abstract class PaymentStates {}

class InitPaymentState extends PaymentStates {}

class LoadingAuthTokenPaymentState extends PaymentStates {}

class SuccessAuthTokenPaymentState extends PaymentStates {}

class ErrorAuthTokenPaymentState extends PaymentStates {}

class LoadingOrderIdPaymentState extends PaymentStates {}

class SuccessOrderIdPaymentState extends PaymentStates {}

class ErrorOrderIdPaymentState extends PaymentStates {}

class LoadingRequestTokenCardPaymentState extends PaymentStates {}

class SuccessRequestTokenCardPaymentState extends PaymentStates {}

class ErrorRequestTokenCardPaymentState extends PaymentStates {}

class LoadingRequestTokenKioskPaymentState extends PaymentStates {}

class SuccessRequestTokenKioskPaymentState extends PaymentStates {}

class ErrorRequestTokenKioskPaymentState extends PaymentStates {}

class LoadingReferenceCodePaymentState extends PaymentStates {}

class SuccessReferenceCodePaymentState extends PaymentStates {}

class ErrorReferenceCodePaymentState extends PaymentStates {}