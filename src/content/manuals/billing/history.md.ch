%This is the change file for the original Docker's Documentation file.
%This is part of Japanese translation version for Docker's Documantation.

% .md リンクへの (no slash) 対応

@x
title: Invoices and billing history
@y
title: Invoices and billing history
@z

@x
description: Learn how to view invoices and your billing history
keywords: payments, billing, subscription, invoices, renewals, invoice management, billing administration, pay invoice
@y
description: Learn how to view invoices and your billing history
keywords: payments, billing, subscription, invoices, renewals, invoice management, billing administration, pay invoice
@z

@x
Learn how to view and pay invoices, view your billing history, and verify
your billing renewal date. All monthly and annual subscriptions are
automatically renewed at the end of the subscription term using your default
payment method.
@y
Learn how to view and pay invoices, view your billing history, and verify
your billing renewal date. All monthly and annual subscriptions are
automatically renewed at the end of the subscription term using your default
payment method.
@z

@x
{{% include "tax-compliance.md" %}}
@y
{{% include "tax-compliance.md" %}}
@z

@x
## View an invoice
@y
## View an invoice
@z

@x
Your invoice includes the following:
@y
Your invoice includes the following:
@z

@x
- Invoice number
- Date of issue
- Due date
- Your "Bill to" information
- Amount due (in USD)
- Pay online: Select this link to pay your invoice online
- Description of your order, quantity if applicable, unit price, and
amount (in USD)
- Subtotal, discount (if applicable), and total
@y
- Invoice number
- Date of issue
- Due date
- Your "Bill to" information
- Amount due (in USD)
- Pay online: Select this link to pay your invoice online
- Description of your order, quantity if applicable, unit price, and
amount (in USD)
- Subtotal, discount (if applicable), and total
@z

@x
The information listed in the "Bill to" section of your invoice is based on
your billing information. Not all fields are required. The billing information
includes the following:
@y
The information listed in the "Bill to" section of your invoice is based on
your billing information. Not all fields are required. The billing information
includes the following:
@z

@x
- Name (required): The name of the administrator or company
- Address (required)
- Email address (required): The email address that receives all billing-related
emails for the account
- Phone number
- Tax ID or VAT
@y
- Name (required): The name of the administrator or company
- Address (required)
- Email address (required): The email address that receives all billing-related
emails for the account
- Phone number
- Tax ID or VAT
@z

@x
You can’t make changes to a paid or unpaid billing invoice. When you update
your billing information, this change won't update an existing invoice.
@y
You can’t make changes to a paid or unpaid billing invoice. When you update
your billing information, this change won't update an existing invoice.
@z

@x
If you need
to update your billing information, make sure you do so before your
subscription renewal date when your invoice is finalized.
@y
If you need
to update your billing information, make sure you do so before your
subscription renewal date when your invoice is finalized.
@z

@x
For more information, see [Update billing information](details.md).
@y
For more information, see [Update billing information](details.md).
@z

@x
## Pay an invoice
@y
## Pay an invoice
@z

@x
> [!NOTE]
>
> Pay by invoice is only available for subscribers on an annual billing cycle.
To change your billing cycle, see [Change your billing cycle](/manuals/billing/cycle.md).
@y
> [!NOTE]
>
> Pay by invoice is only available for subscribers on an annual billing cycle.
To change your billing cycle, see [Change your billing cycle](manuals/billing/cycle.md).
@z

@x
If you've selected pay by invoice for your subscription, you'll receive email
reminders to pay your invoice at 10 days before the due date, on the due date,
and 15 days after the due date.
@y
If you've selected pay by invoice for your subscription, you'll receive email
reminders to pay your invoice at 10 days before the due date, on the due date,
and 15 days after the due date.
@z

@x
You can pay an invoice from the Docker Billing Console:
@y
You can pay an invoice from the Docker Billing Console:
@z

@x
1. Sign in to [Docker Home](https://app.docker.com/) and choose your organization.
1. Select **Billing**.
1. Select **Invoices** and locate the invoice you want to pay.
1. In the **Actions** column, select **Pay invoice**.
1. Fill out your payment details and select **Pay**.
@y
1. Sign in to [Docker Home](https://app.docker.com/) and choose your organization.
1. Select **Billing**.
1. Select **Invoices** and locate the invoice you want to pay.
1. In the **Actions** column, select **Pay invoice**.
1. Fill out your payment details and select **Pay**.
@z

@x
When your payment has processed, the invoice's **Status** column will update to
**Paid** and you will receive a confirmation email.
@y
When your payment has processed, the invoice's **Status** column will update to
**Paid** and you will receive a confirmation email.
@z

@x
If you choose to pay using a US bank account, you must verify the account. For
more information, see [Verify a bank account](manuals/billing/payment-method.md#verify-a-bank-account).
@y
If you choose to pay using a US bank account, you must verify the account. For
more information, see [Verify a bank account](manuals/billing/payment-method.md#verify-a-bank-account).
@z

@x
### View renewal date
@y
### View renewal date
@z

@x
{{< tabs >}}
{{< tab name="Docker subscription" >}}
@y
{{< tabs >}}
{{< tab name="Docker subscription" >}}
@z

@x
You receive your invoice when the subscription renews. To verify your renewal
date, sign in to the [Docker Home Billing](https://app.docker.com/billing).
Your renewal date and amount are displayed on your subscription plan card.
@y
You receive your invoice when the subscription renews. To verify your renewal
date, sign in to the [Docker Home Billing](https://app.docker.com/billing).
Your renewal date and amount are displayed on your subscription plan card.
@z

@x
{{< /tab >}}
{{< tab name="Legacy Docker subscription" >}}
@y
{{< /tab >}}
{{< tab name="Legacy Docker subscription" >}}
@z

@x
You receive your invoice when the subscription renews. To verify your renewal
date:
@y
You receive your invoice when the subscription renews. To verify your renewal
date:
@z

@x
1. Sign in to [Docker Hub](https://hub.docker.com).
1. Select your user avatar to open the drop-down menu.
1. Select **Billing**.
1. Select the user or organization account to view the billing details. Here
you can find your renewal date and the renewal amount.
@y
1. Sign in to [Docker Hub](https://hub.docker.com).
1. Select your user avatar to open the drop-down menu.
1. Select **Billing**.
1. Select the user or organization account to view the billing details. Here
you can find your renewal date and the renewal amount.
@z

@x
{{< /tab >}}
{{< /tabs >}}
@y
{{< /tab >}}
{{< /tabs >}}
@z

@x
## Include your VAT number on your invoice
@y
## Include your VAT number on your invoice
@z

@x
> [!NOTE]
>
> If the VAT number field is not available, complete the
[Contact Support form](https://hub.docker.com/support/contact/). This field
may need to be manually added.
@y
> [!NOTE]
>
> If the VAT number field is not available, complete the
[Contact Support form](https://hub.docker.com/support/contact/). This field
may need to be manually added.
@z

@x
{{< tabs >}}
{{< tab name="Docker subscription" >}}
@y
{{< tabs >}}
{{< tab name="Docker subscription" >}}
@z

@x
To add or update your VAT number:
@y
To add or update your VAT number:
@z

@x
1. Sign in to [Docker Home](https://app.docker.com/) and choose your
organization.
1. Select **Billing**.
1. Select **Billing information** from the left-hand menu.
1. Select **Change** on your billing information card.
1. Ensure the **I'm purchasing as a business** checkbox is checked.
1. Enter your VAT number in the Tax ID section.
@y
1. Sign in to [Docker Home](https://app.docker.com/) and choose your
organization.
1. Select **Billing**.
1. Select **Billing information** from the left-hand menu.
1. Select **Change** on your billing information card.
1. Ensure the **I'm purchasing as a business** checkbox is checked.
1. Enter your VAT number in the Tax ID section.
@z

@x
    > [!IMPORTANT]
    >
    > Your VAT number must include your country prefix. For example, if you are
    entering a VAT number for Germany, you would enter `DE123456789`.
@y
    > [!IMPORTANT]
    >
    > Your VAT number must include your country prefix. For example, if you are
    entering a VAT number for Germany, you would enter `DE123456789`.
@z

@x
1. Select **Update**.
@y
1. Select **Update**.
@z

@x
Your VAT number will be included on your next invoice.
@y
Your VAT number will be included on your next invoice.
@z

@x
{{< /tab >}}
{{< tab name="Legacy Docker subscription" >}}
@y
{{< /tab >}}
{{< tab name="Legacy Docker subscription" >}}
@z

@x
To add or update your VAT number:
@y
To add or update your VAT number:
@z

@x
1. Sign in to [Docker Hub](https://hub.docker.com).
1. Select your organization, then select **Billing**.
1. Select the **Billing address** link.
1. In the **Billing Information** section, select **Update information**.
1. Enter your VAT number in the Tax ID section.
@y
1. Sign in to [Docker Hub](https://hub.docker.com).
1. Select your organization, then select **Billing**.
1. Select the **Billing address** link.
1. In the **Billing Information** section, select **Update information**.
1. Enter your VAT number in the Tax ID section.
@z

@x
    > [!IMPORTANT]
    >
    > Your VAT number must include your country prefix. For example, if you are
    entering a VAT number for Germany, you would enter `DE123456789`.
@y
    > [!IMPORTANT]
    >
    > Your VAT number must include your country prefix. For example, if you are
    entering a VAT number for Germany, you would enter `DE123456789`.
@z

@x
1. Select **Save**.
@y
1. Select **Save**.
@z

@x
Your VAT number will be included on your next invoice.
@y
Your VAT number will be included on your next invoice.
@z

@x
{{< /tab >}}
{{< /tabs >}}
@y
{{< /tab >}}
{{< /tabs >}}
@z

@x
## View billing history
@y
## View billing history
@z

@x
You can view your billing history and download past invoices for a personal
account or organization.
@y
You can view your billing history and download past invoices for a personal
account or organization.
@z

@x
### Personal account
@y
### Personal account
@z

@x
{{< tabs >}}
{{< tab name="Docker subscription" >}}
@y
{{< tabs >}}
{{< tab name="Docker subscription" >}}
@z

@x
To view billing history:
@y
To view billing history:
@z

@x
1. Sign in to [Docker Home](https://app.docker.com/) and choose your
organization.
1. Select **Billing**.
1. Select **Invoices** from the left-hand menu.
1. Optional. Select the **Invoice number** to open invoice details.
1. Optional. Select the **Download** button to download an invoice.
@y
1. Sign in to [Docker Home](https://app.docker.com/) and choose your
organization.
1. Select **Billing**.
1. Select **Invoices** from the left-hand menu.
1. Optional. Select the **Invoice number** to open invoice details.
1. Optional. Select the **Download** button to download an invoice.
@z

@x
{{< /tab >}}
{{< tab name="Legacy Docker subscription" >}}
@y
{{< /tab >}}
{{< tab name="Legacy Docker subscription" >}}
@z

@x
To view billing history:
@y
To view billing history:
@z

@x
1. Sign in to [Docker Hub](https://hub.docker.com).
1. Select your organization, then select **Billing**.
1. Select the **Payment methods and billing history** link.
@y
1. Sign in to [Docker Hub](https://hub.docker.com).
1. Select your organization, then select **Billing**.
1. Select the **Payment methods and billing history** link.
@z

@x
You can find your past invoices in the **Invoice History** section, where
you can download an invoice.
@y
You can find your past invoices in the **Invoice History** section, where
you can download an invoice.
@z

@x
{{< /tab >}}
{{< /tabs >}}
@y
{{< /tab >}}
{{< /tabs >}}
@z

@x
### Organization
@y
### Organization
@z

@x
You must be an owner of the organization to view the billing history.
@y
You must be an owner of the organization to view the billing history.
@z

@x
{{< tabs >}}
{{< tab name="Docker subscription" >}}
@y
{{< tabs >}}
{{< tab name="Docker subscription" >}}
@z

@x
To view billing history:
@y
To view billing history:
@z

@x
1. Sign in to [Docker Home](https://app.docker.com/) and select your
organization.
1. Select **Billing**.
1. Select **Invoices** from the left-hand menu.
1. Optional. Select the **invoice number** to open invoice details.
1. Optional. Select the **download** button to download an invoice.
@y
1. Sign in to [Docker Home](https://app.docker.com/) and select your
organization.
1. Select **Billing**.
1. Select **Invoices** from the left-hand menu.
1. Optional. Select the **invoice number** to open invoice details.
1. Optional. Select the **download** button to download an invoice.
@z

@x
{{< /tab >}}
{{< tab name="Legacy Docker subscription" >}}
@y
{{< /tab >}}
{{< tab name="Legacy Docker subscription" >}}
@z

@x
To view billing history:
@y
To view billing history:
@z

@x
1. Sign in to [Docker Hub](https://hub.docker.com).
1. Select your organization, then select **Billing**.
1. Select the **Payment methods and billing history** link.
@y
1. Sign in to [Docker Hub](https://hub.docker.com).
1. Select your organization, then select **Billing**.
1. Select the **Payment methods and billing history** link.
@z

@x
You can find your past invoices in the **Invoice History** section, where you
can download an invoice.
@y
You can find your past invoices in the **Invoice History** section, where you
can download an invoice.
@z

@x
{{< /tab >}}
{{< /tabs >}}
@y
{{< /tab >}}
{{< /tabs >}}
@z
