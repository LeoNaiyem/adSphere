@component('mail::message')
# Welcome, {{ $user->name }} 🎉

Thanks for registering with **{{ config('app.name') }}**.
We’re excited to have you onboard!

@component('mail::button', ['url' => config('app.url')])
Go to Dashboard
@endcomponent

Thanks,<br>
{{ config('app.name') }}
@endcomponent