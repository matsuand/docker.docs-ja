%This is the change file for the original Docker's Documentation file.
%This is part of Japanese translation version for Docker's Documantation.

% __SUBDIR__ 対応 / .md リンクへの (no slash) 対応

@x
title: Billing FAQs
linkTitle: FAQs
@y
title: 支払いに関する FAQ
linkTitle: FAQs
@z

@x
description: Frequently asked questions related to billing
keywords: billing, renewal, payments, faq
@y
description: Frequently asked questions related to billing
keywords: billing, renewal, payments, faq
@z

@x
### What credit and debit cards are supported?
@y
### What credit and debit cards are supported?
@z

@x
- Visa
- MasterCard
- American Express
- Discover
- JCB
- Diners
- UnionPay
@y
- Visa
- MasterCard
- American Express
- Discover
- JCB
- Diners
- UnionPay
@z

@x
### What currency is supported?
@y
### What currency is supported?
@z

@x
United States dollar (USD).
@y
US ドル (USD) です。
@z

@x
### What happens if my subscription payment fails?
@y
### What happens if my subscription payment fails?
@z

@x
If your subscription payment fails, there is a grace period of 15 days, including the due date. Docker retries to collect the payment 3 times using the following schedule:
@y
If your subscription payment fails, there is a grace period of 15 days, including the due date. Docker retries to collect the payment 3 times using the following schedule:
@z

@x
- 3 days after the due date
- 5 days after the previous attempt
- 7 days after the previous attempt
@y
- 3 days after the due date
- 5 days after the previous attempt
- 7 days after the previous attempt
@z

@x
Docker also sends an email notification `Action Required - Credit Card Payment Failed` with an attached unpaid invoice after each failed payment attempt. 
@y
Docker also sends an email notification `Action Required - Credit Card Payment Failed` with an attached unpaid invoice after each failed payment attempt. 
@z

@x
Once the grace period is over and the invoice is still not paid, the subscription downgrades to a free plan and all paid features are disabled.
@y
Once the grace period is over and the invoice is still not paid, the subscription downgrades to a free plan and all paid features are disabled.
@z

@x
### Can I manually retry a failed payment?
@y
### Can I manually retry a failed payment?
@z

@x
No. Docker retries failed payments on a [retry schedule](/manuals/billing/faqs.md#what-happens-if-my-subscription-payment-fails).
@y
No. Docker retries failed payments on a [retry schedule](manuals/billing/faqs.md#what-happens-if-my-subscription-payment-fails).
@z

@x
To ensure a retired payment is successful, verify your default payment is
updated. If you need to update your default payment method, see
[Manage payment method](/manuals/billing/payment-method.md#manage-payment-method).
@y
To ensure a retired payment is successful, verify your default payment is
updated. If you need to update your default payment method, see
[Manage payment method](manuals/billing/payment-method.md#manage-payment-method).
@z

@x
### Does Docker collect sales tax and/or VAT?
@y
### Does Docker collect sales tax and/or VAT?
@z

@x
Docker began collecting sales tax on subscription fees for United States customers on July 1, 2024. For European customers, Docker will begin collecting VAT on March 1, 2025.
@y
Docker began collecting sales tax on subscription fees for United States customers on July 1, 2024. For European customers, Docker will begin collecting VAT on March 1, 2025.
@z

@x
To ensure that tax assessments are correct, make sure that your billing information and VAT/Tax ID, if applicable, are updated. See [Update the billing information](/billing/details/).
@y
To ensure that tax assessments are correct, make sure that your billing information and VAT/Tax ID, if applicable, are updated. See [Update the billing information](__SUBDIR__/billing/details/).
@z

@x
### How do I certify my tax exempt status?
@y
### How do I certify my tax exempt status?
@z

@x
If you're exempt from sales tax, you can [register a valid tax exemption certificate](./tax-certificate.md) with Docker's Support team. [Contact Support](https://hub.docker.com/support/contact) to get started.
@y
If you're exempt from sales tax, you can [register a valid tax exemption certificate](./tax-certificate.md) with Docker's Support team. [Contact Support](https://hub.docker.com/support/contact) to get started.
@z

@x
### Does Docker offer academic pricing?
@y
### Does Docker offer academic pricing?
@z

@x
Contact the [Docker Sales Team](https://www.docker.com/company/contact).
@y
Contact the [Docker Sales Team](https://www.docker.com/company/contact).
@z

@x
### Do I need to do anything at the end of my subscription term?
@y
### Do I need to do anything at the end of my subscription term?
@z

@x
No. All monthly and annual subscriptions are automatically renewed at the end of the term using the original form of payment.
@y
No. All monthly and annual subscriptions are automatically renewed at the end of the term using the original form of payment.
@z
